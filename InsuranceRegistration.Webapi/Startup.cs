using InsuranceRegistration.Bl;
using InsuranceRegistration.Bl.Abstract;
using InsuranceRegistration.Bl.Concrete;
using InsuranceRegistration.Dal.Abstract;
using InsuranceRegistration.Dal.Concrete;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.OpenApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InsuranceRegistration.Webapi
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

            #region ServiceSection
            services.AddScoped<IOfferCandidateService, OfferCandidateService>();
            services.AddScoped<IOfferService, OfferService>();
            services.AddScoped<ICandidateService, CandidateService>();
            services.AddScoped<ICustomerService, CustomerService>();
            services.AddScoped<IRegisterManager, RegisterManager>();
            #endregion

            #region ProviderSection
            services.AddScoped<IOfferCandidateProvider, OfferCandidateProvider>();
            services.AddScoped<IOfferProvider, OfferProvider>();
            services.AddScoped<ICandidateProvider, CandidateProvider>();
            services.AddScoped<ICustomerProvider, CustomerProvider>();
            #endregion

            services.AddControllers();
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "InsuranceRegistration.Webapi", Version = "v1" });
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "InsuranceRegistration.Webapi v1"));
            }

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
