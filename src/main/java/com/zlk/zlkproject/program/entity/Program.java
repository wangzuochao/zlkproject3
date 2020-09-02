package com.zlk.zlkproject.program.entity;


import org.springframework.stereotype.Repository;

@Repository
public class Program {

    private Integer programId;
    private String programName;

    public Integer getProgramId() {
        return programId;
    }

    public void setProgramId(Integer programId) {
        this.programId = programId;
    }

    public String getProgramName() {
        return programName;
    }

    public void setProgramName(String programName) {
        this.programName = programName;
    }

    public Program(Integer programId, String programName) {
        this.programId = programId;
        this.programName = programName;
    }

    public Program() {
    }

    @Override
    public String toString() {
        return "Program{" +
                "programId=" + programId +
                ", programName='" + programName + '\'' +
                '}';
    }
}
