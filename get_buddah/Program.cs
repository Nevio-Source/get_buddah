using System.Text.Json;
using System.Net.NetworkInformation;


var http = new HttpClient();



static string ping()
{
    string host = "1.1.1.1";
    Ping ping = new Ping();
            
    try
    {
        PingReply reply = ping.Send(host, 3000); // Timeout 3 Sekunden
        if (reply.Status == IPStatus.Success)
        {
            return "up";
        }
        else
        {
            return "down";
        }
    }
    catch
    {
        return "down";
    }
}

if (ping() == "down")
{
    
    Environment.Exit(0);
}




var json = await http.GetStringAsync("https://buddha-api.com/api/random");
using var doc = JsonDocument.Parse(json);


string text = doc.RootElement.GetProperty("text").GetString();
int string_length = text.Length;



string buddah = """
                   _
                  (")
                 (-"-)
                (_`/._)
                
                """;

string border = new string('-', string_length);

Console.WriteLine(border);

Console.ForegroundColor = ConsoleColor.Yellow;
Console.WriteLine(text);
Console.ResetColor();

Console.WriteLine(border);

Console.ForegroundColor = ConsoleColor.DarkGreen;
Console.WriteLine(buddah);
