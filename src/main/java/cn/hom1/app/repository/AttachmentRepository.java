package cn.hom1.app.repository;

import cn.hom1.app.model.entity.Attachment;
import cn.hom1.app.repository.base.BaseRepository;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AttachmentRepository extends BaseRepository<Attachment, Long> {
}
