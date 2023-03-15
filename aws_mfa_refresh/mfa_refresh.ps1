$aws_access_key_id = "******"
$aws_secret_access_key - "******"
Set-DefaultAWSRegion -Region us-east-1
$code = Read-Host -Prompt 'Enter the MFA code'
$creds = Get-STSSessionToken `
-SerialNumber "arn:aws:iam::accountnumber:mfa/accountname" `
-TokenCode $code `
-Select "Credentials" `
-AccessKey $aws_access_key_id
-SecretKey $aws_secret_access_key
$out = "
[xdefault]
aws_access_key_id = $aws_access_key_id
aws_secret_access_key = $aws_secret_access_key
[default]
aws_access_key_id = $($creds.AccessKeyId)
aws_secret_access_key = $($creds.SecretAccessKey)
aws_session_token = $($creds.SessionToken)
"
Write-Output &out
Out-File -InputObject $out "C:\Users\dwilloughby\.aws\credentials" -Encoding "ascii"