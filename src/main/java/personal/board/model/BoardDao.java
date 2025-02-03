package personal.board.model;

import jakarta.servlet.ServletContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import personal.board.service.DaoService;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class BoardDao implements DaoService<BoardDto> {
    private static final Logger logger = LoggerFactory.getLogger(BoardDao.class);
    private Connection conn;
    private PreparedStatement psmt;
    private ResultSet rs;


    public BoardDao(ServletContext context) {
        try{
            //CreateDataSourceListener 참고
            DataSource source = (DataSource)context.getAttribute("DataSource");
            conn = source.getConnection();
        } catch(SQLException e) {
            logger.error(e.getMessage());
        }
    }

    @Override
    public void close() {
        try{
            if(conn!=null) conn.close();
            if(psmt!=null) psmt.close();
            if(rs!=null) rs.close();
        } catch(SQLException e) {logger.error(e.getMessage());}
    }

    //로그인 시 회원 확인
    public boolean isMember(String id, String pwd) {
        String sql = "SELECT COUNT(*) FROM MEMBER WHERE USERNAME=? AND PASSWORD=?";
        try{
            psmt = conn.prepareStatement(sql);
            psmt.setString(1, id);
            psmt.setString(2, pwd);
            rs = psmt.executeQuery();
            rs.next();
            if(rs.getInt(1)==1) return true;
        } catch(SQLException e) {logger.error(e.getMessage());}
        return false;
    }

    @Override
    public List<BoardDto> selectList(Map map) {
        return null;
    }

    @Override
    public BoardDto selectOne(String... params) {
        return null;
    }

    @Override
    public int getTotalRecordCount(Map map) {
        return 0;
    }

    @Override
    public int insert(BoardDto dto) {
        return 0;
    }

    @Override
    public int update(BoardDto dto) {
        return 0;
    }

    @Override
    public int delete(BoardDto dto) {
        return 0;
    }
}
