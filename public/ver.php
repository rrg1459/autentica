<?php

$url = 'http://sms2.cdyne.com/sms.svc/SimpleSMSsendWithPostback?        PhoneNumber=18887477474&Message=test&LicenseKey=LICENSEKEY';

$cURL = curl_init();

curl_setopt($cURL, CURLOPT_URL, $url);
curl_setopt($cURL, CURLOPT_HTTPGET, true);

curl_setopt($cURL, CURLOPT_HTTPHEADER, array(
    'Content-Type: application/json',
    'Accept: application/json'
));

$result = curl_exec($cURL);

curl_close($cURL);



print_r($result);

?>