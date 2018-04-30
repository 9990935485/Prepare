using System.Web.Http;

namespace PREcare.API.Controllers
{
    public class RegisterController : ApiController
    {
        [HttpGet]
        public IHttpActionResult GetUser()
        {
            return Ok("Vijay");
        }
    }
}
