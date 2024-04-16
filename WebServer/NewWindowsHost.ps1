#Disable Windows Firewall
Set-NetFirewallProfile -Profile Domain, Public, Private -Enabled False

# Username and Password
$username = "ansible"
$password = ConvertTo-SecureString "1q2w3eASD!" -AsPlainText -Force  # Super strong plane text password here (yes this isn't secure at all)

# Creating the user
New-LocalUser -Name "$username" -Password $password -FullName "$username" -Description "Ansible user"

# Add Ansible user to Admin list
Add-LocalGroupMember -Group Administrators -Member ansible

#New SelfSigned Certificate DONOT FORGET TO CHANGE "DNSNAME"
New-SelfSignedCertificate -DnsName "mtpocwebserver" -CertStoreLocation Cert:\LocalMachine\My

$Cert = New-SelfSignedCertificate -CertStoreLocation Cert:\LocalMachine\My -DnsName "mtpocwebserver"

#Enable WS Listener HTTPS
New-Item -Path WSMan:\localhost\Listener\ -Transport HTTPS -Address * -CertificateThumbPrint $Cert.Thumbprint -Force

#Winrm Quick Config
winrm quickconfig -q
