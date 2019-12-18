<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw317="http://www.istandaarden.nl/iwlz/2_1/aw317/schema"
                xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_1/basisschema/schema"
>
    <!-- iwlz 2.1 TR079 version 1.9.16 (2019-12-17) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="TR079"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="TR079"/>
    </xsl:template>

    <xsl:template match="aw317:Indicatie" mode="TR079">
        <xsl:call-template name="tr079">
        	<xsl:with-param name="pCurrent" select="."/>
            <xsl:with-param name="pList" select="preceding-sibling::*"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="tr079">
    	<xsl:param name="pCurrent" select="."/>
        <xsl:param name="pList" select="preceding-sibling::*"/>
        
        <xsl:for-each select="$pList">
   			<xsl:if test="current() != $pCurrent and 
   						((translate(current()/aw317:Afgiftedatum, '-', '') &lt; translate($pCurrent/aw317:Afgiftedatum, '-', '') and
   						current()/aw317:VolgnummerIndicatie &gt;= $pCurrent/aw317:VolgnummerIndicatie) or 
   						(translate(current()/aw317:Afgiftedatum, '-', '') &gt; translate($pCurrent/aw317:Afgiftedatum, '-', '') and
   						current()/aw317:VolgnummerIndicatie &lt;= $pCurrent/aw317:VolgnummerIndicatie))">
   				<xsl:call-template name="addError">
           			<xsl:with-param name="pElements" select="$pCurrent | current()"/>
           			<xsl:with-param name="pRule">TR079</xsl:with-param>
           		</xsl:call-template>
   			</xsl:if>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
