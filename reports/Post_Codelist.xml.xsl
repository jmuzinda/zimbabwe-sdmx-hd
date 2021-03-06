<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
  <CrossSectionalData xmlns="http://www.SDMX.org/resources/SDMXML/schemas/v2_0/message" xmlns:ns="urn:sdmx:org.sdmx.infomodel.keyfamily.KeyFamily=ZW_MOHCW:KF_HW_POST_FAC:1.0:cross" xmlns:cross="http://www.SDMX.org/resources/SDMXML/schemas/v2_0/cross" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.SDMX.org/resources/SDMXML/schemas/v2_0/structure SDMXMessage.xsd urn:sdmx:org.sdmx.infomodel.keyfamily.KeyFamily=ZW_MOHCW:KF_HW_POST_FAC:1.0:cross KF_HW_POST_FAC.xsd http://www.SDMX.org/resources/SDMXML/schemas/v2_0/cross SDMXCrossSectionalData.xsd">
  <Header>
    <ID>SDMX-HD-CSDS</ID>
    <Test>true</Test>
    <Truncated>false</Truncated>
    <Name xml:lang="en">ZHRIS SDMX-HD Export</Name>
    <Prepared>2010-07-01T21:19:22-04:00</Prepared>
    <Sender id="ZW_MOHCW">
      <Name>ZHRIS</Name>
    </Sender>
  </Header>

  <ns:DataSet datasetID="1" dataProviderSchemeAgencyId="1" dataProviderSchemeId="1" dataProviderID="1">
    <ns:Group VALUE_TYPE="0" FREQ="M" TIME_PERIOD="2010-07">	

      <ns:Section>

    <xsl:apply-templates select="/postList"/>
          </ns:Section>
    </ns:Group>
  </ns:DataSet>
</CrossSectionalData>
  </xsl:template>
  <!-- output the faciltiy code list-->
  <xsl:template match="postList">
      <xsl:for-each select="post">
	<xsl:if test="@postId != ''">
	<xsl:for-each select="facility">
          <xsl:if test="@code != ''">
	  <ns:OBS_VALUE >
              <xsl:attribute name="FACILITY">
                <xsl:value-of select="normalize-space(@code)"/>
              </xsl:attribute>
              <xsl:attribute name="DATAELEMENT">
            <xsl:value-of select="normalize-space(../@postId)"/>
            </xsl:attribute>
            <xsl:attribute name="value">
                <xsl:value-of select="normalize-space(value)"/>
              </xsl:attribute>
              </ns:OBS_VALUE>
             </xsl:if>
      </xsl:for-each>
        </xsl:if>
      </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>



