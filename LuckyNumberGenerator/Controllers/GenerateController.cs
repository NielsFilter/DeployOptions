using Microsoft.AspNetCore.Mvc;

namespace LuckyNumberGenerator.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class GenerateController : ControllerBase
    {
        private readonly ILogger<GenerateController> _logger;

        public GenerateController(ILogger<GenerateController> logger)
        {
            _logger = logger;
        }

        [HttpGet("number", Name = "GenerateNumber")]
        public int Get()
        {
            var number = new Random().Next(0, 100);
            _logger.LogInformation("Generated number {0}", number);
            return number;
        }
    }
}