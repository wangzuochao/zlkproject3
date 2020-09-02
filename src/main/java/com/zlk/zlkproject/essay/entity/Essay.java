package com.zlk.zlkproject.essay.entity;


import org.springframework.stereotype.Repository;

@Repository
public class Essay {

    private Integer id;
    private String content;
    private String markdown;

    public String getMarkdown() {
        return markdown;
    }

    public void setMarkdown(String markdown) {
        this.markdown = markdown;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Essay(Integer id, String content) {
        this.id = id;
        this.content = content;
    }

    public Essay() {
    }

    @Override
    public String toString() {
        return "Essay{" +
                "id=" + id +
                ", content='" + content + '\'' +
                '}';
    }
}
