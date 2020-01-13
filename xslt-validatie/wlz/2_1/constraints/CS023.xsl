<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_1/basisschema/schema"
>

    <!-- iWlz 2.1 CS023 version 1.9.17 (2020-01-09) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CS023"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CS023"/>
    </xsl:template>

    <!-- Generic match for all "namespace:Geboortedatum" -->
    <xsl:template match="iwlz:Datum" mode="CS023">
        <xsl:call-template name="checkafter">
            <xsl:with-param name="pThis"
                            select="ancestor-or-self::*[local-name() = 'Bericht']/*[local-name() = 'Header']/*[local-name() = 'BerichtIdentificatie']/iwlz:Dagtekening"/>
            <xsl:with-param name="pOther" select="."/>
            <xsl:with-param name="pRule">
                CS023
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <!-- Generic match for Indicatie/Afgiftedatum -->
    <xsl:template match="*[local-name() = 'Indicatie']/*[local-name() = 'Afgiftedatum']" mode="CS023">
        <xsl:call-template name="checkafter">
            <xsl:with-param name="pThis"
                            select="ancestor-or-self::*[local-name() = 'Bericht']/*[local-name() = 'Header']/*[local-name() = 'BerichtIdentificatie']/iwlz:Dagtekening"/>
            <xsl:with-param name="pOther" select="."/>
            <xsl:with-param name="pRule">
                CS023
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <!-- Generic match for ToegewezenFunctie/Toewijzingsdatum or ToegewezenZorgzwaartepakket/Toewijzingsdatum -->
    <xsl:template
            match="*[local-name() = 'ToegewezenFunctie' or local-name() = 'ToegewezenZorgzwaartepakket']/*[local-name() = 'Toewijzingsdatum']" mode="CS023">
        <xsl:call-template name="checkafter">
            <xsl:with-param name="pThis"
                            select="ancestor-or-self::*[local-name() = 'Bericht']/*[local-name() = 'Header']/*[local-name() = 'BerichtIdentificatie']/iwlz:Dagtekening"/>
            <xsl:with-param name="pOther" select="."/>
            <xsl:with-param name="pRule">
                CS023
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <!-- Generic match for GeleverdeFunctie/Begindatum or GeleverdZorgzwaartepakket/Begindatum -->
    <xsl:template
            match="*[local-name() = 'GeleverdeFunctie' or local-name() = 'GeleverdZorgzwaartepakket']/*[local-name() = 'Begindatum']" mode="CS023">
        <xsl:call-template name="checkafter">
            <xsl:with-param name="pThis"
                            select="ancestor-or-self::*[local-name() = 'Bericht']/*[local-name() = 'Header']/*[local-name() = 'BerichtIdentificatie']/iwlz:Dagtekening"/>
            <xsl:with-param name="pOther" select="."/>
            <xsl:with-param name="pRule">
                CS023
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <!-- Generic match for MutatieZorgzwaartepakket/Mutatiedatum or MutatieFunctie/Mutatiedatum or MutatieZorg/Mutatiedatum -->
    <xsl:template match="*[local-name()='Mutatiedatum']" mode="CS023">
    	<xsl:if test="local-name(..) != 'WachtlijstZorgzwaartepakket'">
	        <xsl:call-template name="checkafter">
	            <xsl:with-param name="pThis"
	                            select="ancestor-or-self::*[local-name() = 'Bericht']/*[local-name() = 'Header']/*[local-name() = 'BerichtIdentificatie']/iwlz:Dagtekening"/>
	            <xsl:with-param name="pOther" select="."/>
	            <xsl:with-param name="pRule">
	                CS023
	            </xsl:with-param>
	        </xsl:call-template>
    	</xsl:if>
    </xsl:template>

    <!-- Generic match for Indicatie/Afgiftedatum -->
    <xsl:template match="*[local-name() = 'MutatieZorg' or local-name() = 'GeleverdeZorg']/*[local-name() = 'Startdatum']" mode="CS023">
        <xsl:call-template name="checkafter">
            <xsl:with-param name="pThis"
                            select="ancestor-or-self::*[local-name() = 'Bericht']/*[local-name() = 'Header']/*[local-name() = 'BerichtIdentificatie']/iwlz:Dagtekening"/>
            <xsl:with-param name="pOther" select="."/>
            <xsl:with-param name="pRule">
                CS023
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <!-- Generic match for all "aw317:Periode/iwlz:Begindatum" -->
    <xsl:template match="*[local-name() = 'Clienten']" mode="CS023">
        <!-- Node only exists in AW317, this check prevents calling the template incase there is no "Periode" in the header -->
        <xsl:if test="normalize-space(ancestor-or-self::*[local-name() = 'Bericht']/*[local-name() = 'Header']/*[local-name() = 'Periode']/iwlz:Begindatum) != ''">
            <xsl:call-template name="checkafter">
                <xsl:with-param name="pThis"
                                select="ancestor-or-self::*[local-name() = 'Bericht']/*[local-name() = 'Header']/*[local-name() = 'BerichtIdentificatie']/iwlz:Dagtekening"/>
                <xsl:with-param name="pOther"
                                select="ancestor-or-self::*[local-name() = 'Bericht']/*[local-name() = 'Header']/*[local-name() = 'Periode']/iwlz:Begindatum"/>
                <xsl:with-param name="pRule">
                    CS023
                </xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>
