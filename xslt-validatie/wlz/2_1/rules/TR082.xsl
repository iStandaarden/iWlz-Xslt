<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw33="http://www.istandaarden.nl/iwlz/2_1/aw33/schema"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_1/zk31/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_1/zk33/schema"
>
    <!-- iwlz 2.1 TR082 version 1.9.16 (2019-12-17) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="TR082"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="TR082"/>
    </xsl:template>

    <xsl:template match="aw33:ToegewezenFunctie" mode="TR082">
        <xsl:call-template name="tr082"/>
    </xsl:template>

    <xsl:template match="zk31:ToegewezenFunctie" mode="TR082">
        <xsl:call-template name="tr082"/>
    </xsl:template>

    <xsl:template match="zk33:ToegewezenFunctie" mode="TR082">
        <xsl:call-template name="tr082"/>
    </xsl:template>

    <xsl:template name="tr082">
        <xsl:param name="toegewezenFunctie" select="."/>
        <xsl:param name="geindiceerdeFuncties" select="../../*[local-name() = 'GeindiceerdeFuncties']/*[local-name() = 'GeindiceerdeFunctie']"/>

        <xsl:choose>
            <xsl:when test="$toegewezenFunctie/*[local-name() = 'FunctieCode'] = '91' and
                            $toegewezenFunctie/*[local-name() = 'Soort'] = '1'">
                <xsl:if test="count($geindiceerdeFuncties/*[local-name() = 'FunctieCode' and text() = '91']) = 0">
                    <xsl:call-template name="addError">
                        <xsl:with-param name="pElements" select="$toegewezenFunctie"/>
                        <xsl:with-param name="pRule">TR082</xsl:with-param>
                    </xsl:call-template>
                </xsl:if>
            </xsl:when>
            <xsl:when test="$toegewezenFunctie/*[local-name() = 'FunctieCode'] = '91' and
                            $toegewezenFunctie/*[local-name() = 'Soort'] != '1'">
                <xsl:call-template name="addError">
                    <xsl:with-param name="pElements" select="$toegewezenFunctie"/>
                    <xsl:with-param name="pRule">TR082</xsl:with-param>
                </xsl:call-template>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
