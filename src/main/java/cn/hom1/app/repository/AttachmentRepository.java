package cn.hom1.app.repository;

import cn.hom1.app.model.entity.Attachment;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AttachmentRepository extends JpaRepository<Attachment,String> {
    Attachment findByAttachId(long attachId);
}
