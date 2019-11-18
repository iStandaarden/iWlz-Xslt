<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw33="http://www.istandaarden.nl/iwlz/2_1/aw33/schema"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_1/zk31/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_1/zk33/schema"
                xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_1/basisschema/schema"
>
    <!-- iwlz 2.1 TR016 version 1.8.2 (2019-08-05) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="TR016"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="TR016"/>
    </xsl:template>

    <xsl:template match="aw33:ToegewezenFunctie" mode="TR016">
        <xsl:call-template name="tr016">
        	<xsl:with-param name="pIndicatie" select="ancestor::aw33:Indicatie"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="aw33:ToegewezenZorgzwaartepakket" mode="TR016">
        <xsl:call-template name="tr016">
        	<xsl:with-param name="pIndicatie" select="ancestor::aw33:Indicatie"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="zk31:ToegewezenFunctie" mode="TR016">
        <xsl:call-template name="tr016">
        	<xsl:with-param name="pIndicatie" select="ancestor::zk31:Indicatie"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="zk31:ToegewezenZorgzwaartepakket" mode="TR016">
        <xsl:call-template name="tr016">
        	<xsl:with-param name="pIndicatie" select="ancestor::zk31:Indicatie"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="zk33:ToegewezenFunctie" mode="TR016">
        <xsl:call-template name="tr016">
        	<xsl:with-param name="pIndicatie" select="ancestor::zk33:Indicatie"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="zk33:ToegewezenZorgzwaartepakket" mode="TR016">
        <xsl:call-template name="tr016">
        	<xsl:with-param name="pIndicatie" select="ancestor::zk33:Indicatie"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="tr016">
	    <xsl:param name="pThis" select="."/>
	    <xsl:param name="pIndicatie" select="./ancestor::*[local-name() = 'Indicatie']"/>
	    
		<xsl:variable name="isWithin">
			<xsl:call-template name="isPeriodWithinPeriod">
				<xsl:with-param name="pThis" select="$pThis"/>
				<xsl:with-param name="pOther" select="$pIndicatie"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:if test="$isWithin = 'false'">
			<xsl:call-template name="addError">
				<xsl:with-param name="pElements" select="$pThis"/>
				<xsl:with-param name="pRule">TR016</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
    </xsl:template>

</xsl:stylesheet>
