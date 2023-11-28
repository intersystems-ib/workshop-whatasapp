Class Whatsapp.Production Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Whatsapp.Production" LogGeneralTraceEvents="true">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="HL7_File_In" Category="" ClassName="EnsLib.HL7.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="MessageSchemaCategory">2.5.1</Setting>
    <Setting Target="Adapter" Name="FilePath">/shared/HL7In/</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.hl7</Setting>
    <Setting Target="Host" Name="TargetConfigNames">From_HL7_To_Message</Setting>
  </Item>
  <Item Name="Whatsapp_Message_Out" Category="" ClassName="Whatsapp.BO.WhatsAppBO" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="HTTPServer">graph.facebook.com</Setting>
    <Setting Target="Host" Name="PhoneNumberId"></Setting>
    <Setting Target="Host" Name="Token"></Setting>
    <Setting Target="Host" Name="Version">v17.0</Setting>
    <Setting Target="Adapter" Name="SSLCheckServerIdentity">1</Setting>
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
    <Setting Target="Adapter" Name="SSLConfig">ISC.FeatureTracker.SSL.Config</Setting>
    <Setting Target="Adapter" Name="URL"></Setting>
    <Setting Target="Adapter" Name="HTTPPort"></Setting>
  </Item>
  <Item Name="From_HL7_To_Message" Category="" ClassName="Whatsapp.BP.GetDataMessage" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
