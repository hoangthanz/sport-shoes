using AutoMapper;

using SportShoes.Application.System.Users;
using SportShoes.CronJobs;
using SportShoes.Data.EF;
using SportShoes.Data.Entities;
using SportShoes.HubConfig;
using SportShoes.Infrastructure.Interfaces;
using SportShoes.Utilities.Constants;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.FileProviders;
using Microsoft.Extensions.Hosting;
using Microsoft.OpenApi.Models;
using System;
using System.Collections.Generic;
using System.IO;

namespace SportShoes
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }


        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {

            services.AddCors(options =>
            {
                options.AddPolicy(name: "MyPolicy",
                    builder =>
                    {
                        builder.WithOrigins(
                            "http://192.168.1.254:4200",
                            "http://localhost:4200",
                            "https://localhost:4200",
                            "http://27.73.67.222:4200",
                            "http://27.73.67.222:6999",
                            "http://27.73.67.222:7000",
                            "http://localhost:6999",
                            "http://localhost:7000"
                            )
                        .AllowAnyMethod().AllowAnyHeader().AllowCredentials();
                    });
            });


            services.AddDbContext<SportShoesDbContext>(options =>
              options.UseSqlServer(Configuration.GetConnectionString(SystemConstants.MainConnectionString)));


            services.Configure<FormOptions>(o =>
            {
                o.ValueLengthLimit = int.MaxValue;
                o.MultipartBodyLengthLimit = int.MaxValue;
                o.MemoryBufferThreshold = int.MaxValue;
            });


            services.AddSignalR();
            services.AddControllers();


            services.AddIdentity<AppUser, AppRole>()
                .AddEntityFrameworkStores<SportShoesDbContext>()
                .AddDefaultTokenProviders();


            // Declare DI

            services.AddTransient<UserManager<AppUser>, UserManager<AppUser>>();
            services.AddTransient<SignInManager<AppUser>, SignInManager<AppUser>>();
            services.AddTransient<RoleManager<AppRole>, RoleManager<AppRole>>();
            services.AddTransient<IUserService, UserService>();


            services.AddAutoMapper();

            services.AddSingleton(Mapper.Configuration);

            services.AddScoped<IMapper>(sp => new Mapper(sp.GetRequiredService<AutoMapper.IConfigurationProvider>(), sp.GetService));

            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "Lottery Manager API", Version = "v1" });

                c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
                {
                    Description = @"JWT Authorization header using the Bearer scheme. \r\n\r\n
                      Enter 'Bearer' [space] and then your token in the text input below.
                      \r\n\r\nExample: 'Bearer 0xxxxxx'",
                    Name = "Authorization",
                    In = ParameterLocation.Header,
                    Type = SecuritySchemeType.ApiKey,
                    Scheme = "Bearer"
                });

                c.AddSecurityRequirement(new OpenApiSecurityRequirement()
                {
                    {
                        new OpenApiSecurityScheme
                        {
                            Reference = new OpenApiReference
                            {
                                Type = ReferenceType.SecurityScheme,
                                Id = "Bearer"
                            },

                            Scheme = "oauth2",
                            Name = "Bearer",
                            In = ParameterLocation.Header,
                        },
                        new List<string>()
                      }
                    });
            });


            services.AddAuthentication("Bearer")
                   .AddJwtBearer("Bearer", options =>
                   {
                       options.Authority = "https://localhost:5000";
                       options.RequireHttpsMetadata = true;

                       options.Audience = "thanhoangAPI";
                   });

            services.AddDirectoryBrowser();


            services.AddTransient(typeof(IUnitOfWork), typeof(EFUnitOfWork));
            services.AddTransient(typeof(IRepository<,>), typeof(EFRepository<,>));



            services.AddScoped<IBackUpScopedService, BackUpScopedService>();

            services.AddCronJob<BackUpCronJob>(c =>
            {
                c.TimeZoneInfo = TimeZoneInfo.Local;
                c.CronExpression = @"* * * * *";
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseDefaultFiles();
            app.UseStaticFiles();

            app.UseDirectoryBrowser(new DirectoryBrowserOptions
            {
                FileProvider = new PhysicalFileProvider(Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "images")),
                RequestPath = "/images"
            });
                
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseCors("MyPolicy");

            app.UseHttpsRedirection();

            app.UseAuthentication();
            app.UseRouting();





            app.UseAuthorization();

            app.UseSwagger();
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "Lottery API V1");
                c.RoutePrefix = string.Empty;
            });

            app.Use(async (context, next) =>
            {
                var hubContext = context.RequestServices
                                        .GetRequiredService<IHubContext<AccountHub>>();
                //...

                if (next != null)
                {
                    await next.Invoke();
                }
            });

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
                endpoints.MapHub<AccountHub>("/accountHub");
            });
        }
    }
}
