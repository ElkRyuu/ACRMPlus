package cn.hlj.crm.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import cn.hlj.crm.entity.Dict;

public interface DictRepository extends BaseRepository<Dict, Long> {

	@Query(value = "SELECT item FROM dicts WHERE type=:type", nativeQuery = true)
	List<String> getItemsByType(@Param("type") String type);
}
