(*NodeCRC64:0, FileCRC64:0*)
FUNCTION_BLOCK FB_LowPass
VAR_INPUT
    lrInput : LREAL;
    lrCutoffFreq : LREAL;
    lrSampleTime : LREAL;
END_VAR
VAR_OUTPUT
    lrOutput : LREAL;
END_VAR
VAR
    lrAlpha : LREAL;
END_VAR

Body
    IF lrCutoffFreq > 0.0 AND lrSampleTime > 0.0 THEN
        lrAlpha := lrSampleTime /
                   (lrSampleTime + (1.0 / (2.0 * 3.14159265359 * lrCutoffFreq)));

        lrOutput := lrOutput + lrAlpha * (lrInput - lrOutput);
    ELSE
        lrOutput := lrInput;
    END_IF;
EndBody

(*{"Version":"1.0.0.0","Path":"FB_LowPass","ObjectType":"FunctionBlock"}*)

END_FUNCTION_BLOCK
