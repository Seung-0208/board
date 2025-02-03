package personal.board.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Date;
@Getter
@Setter
@NoArgsConstructor
public class BoardDto {
    private String originNo;
    private String no;
    private String username;
    private String title;
    private String content;
    private String visitCount;
    private Date postDate;
    private String lno; //좋아요
    private String name; //실명

    public BoardDto(String no, String username, String title, String content, String visitCount, Date postDate, String lno, String name) {
        this.no = no;
        this.username = username;
        this.title = title;
        this.content = content;
        this.visitCount = visitCount;
        this.postDate = postDate;
        this.lno = lno;
        this.name = name;
    }
}
