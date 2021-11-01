package com.bluecc.workflow;

public interface IProcessor <I,O>{
    O process(I input);
}
