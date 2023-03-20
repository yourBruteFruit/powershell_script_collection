# test shows that local configuration of Web-Server feature is installed
describe 'IIS' {
    context 'Windows feature' {
        it "installs the Web-Server Windows feature" {
            $parameters = @{
                ComputerName = 'WEBSRV1'
                NAME         = 'Web-Server'
            }
            (Get-WindowsFeature @parameters).Installed | should -Be $true
        }
    }
}