<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:gmd="http://www.isotc211.org/2005/gmd"
                xmlns:gco="http://www.isotc211.org/2005/gco"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="#all"
                version="3.0">

  <xsl:import href="../../schemas-utils/util-iso19139.xsl"/>
  <xsl:import href="../../html-util.xsl"/>

  <xsl:template match="gmd:*[gco:CharacterString]"
                mode="landingpage" priority="2">

    <xsl:variable name="labelKey"
                  select="name(.)"
                  as="xs:string"/>
    <xsl:variable name="label"
                  select="$i18nStandard/labels/element[@name = $labelKey]/label/text()"/>
    <xsl:call-template name="html-field">
      <xsl:with-param name="label" select="$label"/>
      <xsl:with-param name="text">
        <xsl:call-template name="getText"/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
</xsl:stylesheet>