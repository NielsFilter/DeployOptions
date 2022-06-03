namespace WebApi
{
    public class LuckyNumberGeneratorService
    {
        private readonly HttpClient _httpClient;
        private readonly ILogger _logger;

        public LuckyNumberGeneratorService(HttpClient httpClient, ILogger logger)
        {
            _httpClient = httpClient;
            _logger = logger;
        }

        public async Task<int> FetchLuckyNumberOfTheDay()
        {
            _logger.LogInformation("Http client address is '{0}'", _httpClient.BaseAddress);
            return await _httpClient.GetFromJsonAsync<int>("generate/number");
        }
    }
}