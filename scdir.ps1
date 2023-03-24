$session = New-Object Microsoft.PowerShell.Commands.WebRequestSession
$session.UserAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 OPR/96.0.0.0"
$session.Cookies.Add((New-Object System.Net.Cookie("search_ab", "%7B%227%22%3A82%7D")))
# I got this part from opera developer tools by saving the XHR request as powershell  
#$years="1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013"
$years="2022,2023"
$totalValues=5000
for ($num = 0 ; $num -le $totalValues ; $num=$num+100){
    $offset=$num
    $uri="https://www.jsondatasource1234.com/api?years="+$years+"&offset="+$offset+"&show=100"
    #first make the request then select the content and save it to a file
    Invoke-WebRequest -UseBasicParsing -Uri $uri | select -ExpandProperty Content | Out-File -FilePath jsonOutFile.json -Append -Encoding UTF-8
    #wait 3 seconds before making the next request
    Start-Sleep -Milliseconds 3000
}

