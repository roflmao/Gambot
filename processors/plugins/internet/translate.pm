#This plugin has dependencies that do not come with Perl 5.10. You need a module that allows LWP to use SSL for HTTPS protocol.
push (@commands_regexes, "$sl !translate (.+)\$");
push (@commands_helps, "!translate - Translates a string to English with the help of Google translate.");
push (@commands_subs, sub {
  $answer = "$1";
  $answer = uri_escape($answer);
  my $url = "https://www.googleapis.com/language/translate/v2?key=AIzaSyA7oMrml5891LSmnZY0scg7gKLRnvb54Pc&target=en&q=$answer";

  my $request = LWP::UserAgent->new;
  $request->timeout(60);
  $request->env_proxy;
  $request->agent('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0)');
  my $response = $request->get("$url");
  $answer = $response->decoded_content;
  if ($answer =~ /"translatedText": "(.+)",(\n|.)+"detectedSourceLanguage": "(.+)"/) { 
    $answer = "$3 to en: $1"; 
  }
  else { 
    $answer = 0; 
  }

  ($answer) ? ACT("MESSAGE",$target,"$receiver: $answer") : ACT("MESSAGE",$target,"$sender: Translation was unsuccessful.");
});