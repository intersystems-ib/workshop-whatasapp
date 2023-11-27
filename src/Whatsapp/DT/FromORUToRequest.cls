Class Whatsapp.DT.FromORUToRequest Extends Ens.DataTransformDTL [ DependsOn = (EnsLib.HL7.Message, Whatsapp.Message.WhatsAppRequest) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='Whatsapp.Message.WhatsAppRequest' sourceDocType='2.5.1:ORU_R01' create='existing' language='objectscript' >
<assign value='"34"_source.{PIDgrpgrp(1).PIDgrp.PID:PhoneNumberHome(1)}' property='target.telephone' action='set' />
<code>
<![CDATA[ set maxLimit = $P(source.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ReferencesRange"),"-",2)]]></code>
<if condition='source.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationIdentifier.Identifier} = "GLU"' >
<true>
<if condition='source.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationValue()} &gt; ($get(maxLimit) * 1.2)' >
<true>
<assign value='"alert_glucose"' property='target.template' action='set' />
</true>
<false>
<if condition='source.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationValue()} &gt; $get(maxLimit) ' >
<true>
<assign value='"warning_glucose"' property='target.template' action='set' />
</true>
<false>
<assign value='"notification_glucose"' property='target.template' action='set' />
</false>
</if>
</false>
</if>
</true>
</if>
</transform>
}

}
