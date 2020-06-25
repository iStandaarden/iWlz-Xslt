<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw39="http://www.istandaarden.nl/iwlz/2_2/aw39/schema"
                xmlns:zk39="http://www.istandaarden.nl/iwlz/2_2/zk39/schema"
>
    <!-- iwlz 2.1 TR046 version 2.1.1 (2020-06-17) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="TR046"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="TR046"/>
    </xsl:template>

    <xsl:template match="aw39:MutatieZorgzwaartepakket" mode="TR046">
        <xsl:call-template name="tr046"/>
    </xsl:template>

    <xsl:template match="zk39:MutatieZorgzwaartepakket" mode="TR046">
        <xsl:call-template name="tr046"/>
    </xsl:template>

    <xsl:template name="tr046">
        <xsl:param name="pMutatiecode" select="./*[local-name() = 'Mutatiecode']"/>
        <xsl:param name="pLeveringsstatus" select="./*[local-name() = 'Leveringsstatus']"/>

        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pThis" select="$pMutatiecode"/>
            <xsl:with-param name="pValue1">12</xsl:with-param>
            <xsl:with-param name="pOther" select="$pLeveringsstatus"/>
            <xsl:with-param name="pValue2">3,5</xsl:with-param>
            <xsl:with-param name="pRule">
                TR046
            </xsl:with-param>
        </xsl:call-template>

        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pThis" select="$pMutatiecode"/>
            <xsl:with-param name="pValue1">17,19,21</xsl:with-param>
            <xsl:with-param name="pOther" select="$pLeveringsstatus"/>
            <xsl:with-param name="pValue2">5</xsl:with-param>
            <xsl:with-param name="pRule">
                TR046
            </xsl:with-param>
        </xsl:call-template>

        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pThis" select="$pMutatiecode"/>
            <xsl:with-param name="pValue1">18</xsl:with-param>
            <xsl:with-param name="pOther" select="$pLeveringsstatus"/>
            <xsl:with-param name="pValue2">2,6,7</xsl:with-param>
            <xsl:with-param name="pRule">
                TR046
            </xsl:with-param>
        </xsl:call-template>

        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pThis" select="$pMutatiecode"/>
            <xsl:with-param name="pValue1">20</xsl:with-param>
            <xsl:with-param name="pOther" select="$pLeveringsstatus"/>
            <xsl:with-param name="pValue2">2,3,6,7</xsl:with-param>
            <xsl:with-param name="pRule">
                TR046
            </xsl:with-param>
        </xsl:call-template>

    </xsl:template>
    
</xsl:stylesheet>
