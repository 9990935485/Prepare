using System;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using Microsoft.IdentityModel.Tokens;
using System.Collections.Generic;

namespace PREcare.API
{
    public class TokenValidationHandler : DelegatingHandler
    {
        protected override Task<HttpResponseMessage> SendAsync(HttpRequestMessage request, CancellationToken cancellationToken)
        {
            HttpStatusCode statusCode;
            string token;
            if (!RetrieveTokenIfExists(request, out token))
            {
                return base.SendAsync(request, cancellationToken);
            }

            try
            {
                const string communicationKey = "123htgfury6784nmskiyfdjou9997937493434nmdkdjd738292bjfdkfgdkfsdfks28323n";
                var securityKey = new SymmetricSecurityKey(System.Text.Encoding.Default.GetBytes(communicationKey));

                var handler = new JwtSecurityTokenHandler();
                var validationParameters = new TokenValidationParameters
                {
                    ValidAudience = "http://myprecare.com",
                    ValidIssuer = "http://myprecare.com",
                    ValidateLifetime = true,
                    ValidateIssuerSigningKey = true,
                    LifetimeValidator = LifetimeValidator,
                    IssuerSigningKey = securityKey
                };

                Thread.CurrentPrincipal = handler.ValidateToken(token, validationParameters, out _);
                HttpContext.Current.User = handler.ValidateToken(token, validationParameters, out _);

                return base.SendAsync(request, cancellationToken);
            }
            catch (SecurityTokenValidationException)
            {
                statusCode = HttpStatusCode.Unauthorized;
            }
            catch (Exception)
            {
                statusCode = HttpStatusCode.InternalServerError;
            }

            return Task<HttpResponseMessage>.Factory.StartNew(() => new HttpResponseMessage(statusCode), cancellationToken);
        }

        private bool RetrieveTokenIfExists(HttpRequestMessage request, out string token)
        {
            token = null;
            IEnumerable<string> authorizationHeader;
            if (!request.Headers.TryGetValues("Authorization", out authorizationHeader))
                return false;

            if (authorizationHeader == null)
                return false;

            var authorizationHeaderList = authorizationHeader.ToList();
            if (authorizationHeaderList.Count > 1)
                return false;

            var bearerToken = authorizationHeaderList.ElementAt(0);
            token = bearerToken.StartsWith("Bearer ") ? bearerToken.Substring(7) : bearerToken;
            return true;
        }

        private bool LifetimeValidator(DateTime? notBefore, DateTime? expires, SecurityToken securityToken, TokenValidationParameters validationParameters)
        {
            if (expires == null) return false;
            return DateTime.UtcNow < expires;
        }
    }
}