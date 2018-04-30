using Microsoft.IdentityModel.Tokens;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Net;
using System.Security.Claims;
using System.Text;
using System.Web.Http;

namespace PREcare.API.Controllers
{
    public class LoginController : ApiController
    {
        [HttpPost]
        // public IHttpActionResult Authenticate([FromBody]  LoginRequest loginRequest)
        public IHttpActionResult Authenticate()
        {
            var userIsValid = true;// loginRequest.Password == "admin"; // Call BL to check if user exists

            if (!userIsValid) return StatusCode(HttpStatusCode.Unauthorized);

            var token = CreateToken("ABC", "1234", "Admin");
            return Ok(token);
        }

        private string CreateToken(string userName, string userId, string userRole)
        {
            var claimsIdentity = new ClaimsIdentity(new[]
            {
                new Claim(ClaimTypes.Name, userName),
                new Claim(ClaimTypes.NameIdentifier,userId),
                new Claim(ClaimTypes.Role,userRole)
            });

            const string communicationKey = "123htgfury6784nmskiyfdjou9997937493434nmdkdjd738292bjfdkfgdkfsdfks28323n";
            var securityKey = new SymmetricSecurityKey(Encoding.Default.GetBytes(communicationKey));
            var signingCredentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256Signature);

            var tokenHandler = new JwtSecurityTokenHandler();

            var token = tokenHandler.CreateJwtSecurityToken(
                issuer: "http://myprecare.com",
                audience: "http://myprecare.com",
                subject: claimsIdentity,
                notBefore: DateTime.UtcNow,
                expires: DateTime.UtcNow.AddDays(7),
                signingCredentials: signingCredentials);

            var serializedToken = tokenHandler.WriteToken(token);

            return serializedToken;
        }
    }
}
