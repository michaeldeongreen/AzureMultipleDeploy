<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="AzureMultipleDeploy.CloudService" generation="1" functional="0" release="0" Id="24f668c8-97b5-479d-9eb5-a7dab4940268" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="AzureMultipleDeploy.CloudServiceGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="AzureMultipleDeploy.WebRole:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/AzureMultipleDeploy.CloudService/AzureMultipleDeploy.CloudServiceGroup/LB:AzureMultipleDeploy.WebRole:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="AzureMultipleDeploy.WebRole:APPINSIGHTS_INSTRUMENTATIONKEY" defaultValue="">
          <maps>
            <mapMoniker name="/AzureMultipleDeploy.CloudService/AzureMultipleDeploy.CloudServiceGroup/MapAzureMultipleDeploy.WebRole:APPINSIGHTS_INSTRUMENTATIONKEY" />
          </maps>
        </aCS>
        <aCS name="AzureMultipleDeploy.WebRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/AzureMultipleDeploy.CloudService/AzureMultipleDeploy.CloudServiceGroup/MapAzureMultipleDeploy.WebRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="AzureMultipleDeploy.WebRoleInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/AzureMultipleDeploy.CloudService/AzureMultipleDeploy.CloudServiceGroup/MapAzureMultipleDeploy.WebRoleInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:AzureMultipleDeploy.WebRole:Endpoint1">
          <toPorts>
            <inPortMoniker name="/AzureMultipleDeploy.CloudService/AzureMultipleDeploy.CloudServiceGroup/AzureMultipleDeploy.WebRole/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapAzureMultipleDeploy.WebRole:APPINSIGHTS_INSTRUMENTATIONKEY" kind="Identity">
          <setting>
            <aCSMoniker name="/AzureMultipleDeploy.CloudService/AzureMultipleDeploy.CloudServiceGroup/AzureMultipleDeploy.WebRole/APPINSIGHTS_INSTRUMENTATIONKEY" />
          </setting>
        </map>
        <map name="MapAzureMultipleDeploy.WebRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/AzureMultipleDeploy.CloudService/AzureMultipleDeploy.CloudServiceGroup/AzureMultipleDeploy.WebRole/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapAzureMultipleDeploy.WebRoleInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/AzureMultipleDeploy.CloudService/AzureMultipleDeploy.CloudServiceGroup/AzureMultipleDeploy.WebRoleInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="AzureMultipleDeploy.WebRole" generation="1" functional="0" release="0" software="C:\Git\AzureMultipleDeploy\AzureMultipleDeploy.CloudService\csx\Release\roles\AzureMultipleDeploy.WebRole" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="-1" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="APPINSIGHTS_INSTRUMENTATIONKEY" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;AzureMultipleDeploy.WebRole&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;AzureMultipleDeploy.WebRole&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/AzureMultipleDeploy.CloudService/AzureMultipleDeploy.CloudServiceGroup/AzureMultipleDeploy.WebRoleInstances" />
            <sCSPolicyUpdateDomainMoniker name="/AzureMultipleDeploy.CloudService/AzureMultipleDeploy.CloudServiceGroup/AzureMultipleDeploy.WebRoleUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/AzureMultipleDeploy.CloudService/AzureMultipleDeploy.CloudServiceGroup/AzureMultipleDeploy.WebRoleFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="AzureMultipleDeploy.WebRoleUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="AzureMultipleDeploy.WebRoleFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="AzureMultipleDeploy.WebRoleInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="d903dc28-27f1-4e01-a302-62dafff51fa7" ref="Microsoft.RedDog.Contract\ServiceContract\AzureMultipleDeploy.CloudServiceContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="d769fc9a-1eee-4e94-93c9-794d143bfde2" ref="Microsoft.RedDog.Contract\Interface\AzureMultipleDeploy.WebRole:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/AzureMultipleDeploy.CloudService/AzureMultipleDeploy.CloudServiceGroup/AzureMultipleDeploy.WebRole:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>