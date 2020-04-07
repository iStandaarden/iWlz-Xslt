<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_1/basisschema/schema"
                xmlns:ca317="http://www.istandaarden.nl/iwlz/2_1/ca317/schema">
    <!-- iWlz 2.1 CD071 version 1.9.20 (2020-04-06) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CD071"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CD071"/>
    </xsl:template>

    <xsl:template match="ca317:GeleverdeZorg" mode="CD071">
    	<xsl:choose>
    		<xsl:when test="translate(ca317:Startdatum/text(), '-', '') &gt; 20191231">
		        <xsl:call-template name="checksame">
		            <xsl:with-param name="pThis" select="ca317:Startdatum"/>
		            <xsl:with-param name="pValue1">#</xsl:with-param>
		            <xsl:with-param name="pOther" select="ca317:Klasse"/>
		            <xsl:with-param name="pValue2">!#</xsl:with-param>
		            <xsl:with-param name="pRule">CD071</xsl:with-param>
		            <xsl:with-param name="pExtra" select="ca317:Leveringsvorm" />
		        </xsl:call-template>
    		</xsl:when>
    		<xsl:otherwise>
		        <xsl:call-template name="checksame">
		            <xsl:with-param name="pThis" select="ca317:Leveringsvorm"/>
		            <xsl:with-param name="pValue1">4,5</xsl:with-param>
		            <xsl:with-param name="pOther" select="ca317:Klasse"/>
		            <xsl:with-param name="pValue2">#</xsl:with-param>
		            <xsl:with-param name="pRule">CD071</xsl:with-param>
		            <xsl:with-param name="pExtra" select="ca317:Startdatum" />
		        </xsl:call-template>
    		</xsl:otherwise>
    	</xsl:choose>
    </xsl:template>

</xsl:stylesheet>