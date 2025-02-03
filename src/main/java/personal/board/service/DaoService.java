package personal.board.service;

import java.util.List;
import java.util.Map;

public interface DaoService<T> {
    void close();
    List<T> selectList(Map map);
    T selectOne(String...params);
    int getTotalRecordCount(Map map);
    int insert(T dto);
    int update(T dto);
    int delete(T dto);
}
