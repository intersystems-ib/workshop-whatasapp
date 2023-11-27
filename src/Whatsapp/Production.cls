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
    <Setting Target="Adapter" Name="FileSpec">*</Setting>
    <Setting Target="Host" Name="TargetConfigNames">From_HL7_To_Message</Setting>
  </Item>
  <Item Name="Whatsapp_Message_Out" Category="" ClassName="Whatsapp.BO.WhatsAppBO" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="HTTPServer">graph.facebook.com</Setting>
    <Setting Target="Host" Name="PhoneNumberId">154600987744279</Setting>
    <Setting Target="Host" Name="Token">EAAO8Yhef4D4BO4KMV9ZCG9w9ZBZBCbihzey2msIDuLOxiBsWYGCFisxmiJDJjDWzq3jDcddMk0rTQl9nzKP7B1fWd9Mj3ZB0ZByaKtV6SriNf9EnAqbb3tIUanIiZAQgjnr0qDs14fE77lf6YSGguZB3VlyzbHk0wBsYyZAKWfdjK0sDHchqeof8FuRiujvI1yq6v94br2JgfxsaTFBUNCLpmftfZCZBIZD</Setting>
    <Setting Target="Host" Name="Version">v17.0</Setting>
    <Setting Target="Adapter" Name="SSLCheckServerIdentity">1</Setting>
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
    <Setting Target="Adapter" Name="SSLConfig">default</Setting>
    <Setting Target="Adapter" Name="URL"></Setting>
    <Setting Target="Adapter" Name="HTTPPort"></Setting>
  </Item>
  <Item Name="From_HL7_To_Message" Category="" ClassName="Whatsapp.BP.GetDataMessage" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
