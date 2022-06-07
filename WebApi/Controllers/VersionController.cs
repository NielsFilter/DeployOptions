using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class VersionController : ControllerBase
    {
        public VersionController()
        {
            _logger = logger;
        }

        [HttpGet]
        public string Get()
        {
            return Assembly.GetExecutingAssembly().GetName().Version.ToString();
        }
    }
}