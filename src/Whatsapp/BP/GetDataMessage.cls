/// 
Class Whatsapp.BP.GetDataMessage Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='EnsLib.HL7.Message' response='Whatsapp.Message.WhatsAppResponse' height='2000' width='2000' >
<context>
<property name='whatsappRequest' type='Whatsapp.Message.WhatsAppRequest' instantiate='1' />
<property name='whatsappResponse' type='Whatsapp.Message.WhatsAppResponse' instantiate='1' />
</context>
<sequence xend='200' yend='650' >
<transform name='Get data from message' class='Whatsapp.DT.FromORUToRequest' source='request' target='context.whatsappRequest' xpos='275' ypos='255' />
<code name='Create response' xpos='200' ypos='450' >
<![CDATA[ set context.whatsappResponse = ##class(Whatsapp.Message.WhatsAppResponse).%New()]]>
</code>
<call name='Call BO' target='Whatsapp_Message_Out' async='1' xpos='200' ypos='550' >
<request type='Whatsapp.Message.WhatsAppRequest' >
<assign property="callrequest" value="context.whatsappRequest" action="set" />
</request>
<response type='Whatsapp.Message.WhatsAppResponse' >
<assign property="callresponse" value="context.whatsappResponse" action="set" />
</response>
</call>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
