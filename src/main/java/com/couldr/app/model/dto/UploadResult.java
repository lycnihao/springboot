package com.couldr.app.model.dto;

import lombok.Data;
import lombok.ToString;
import org.springframework.http.MediaType;

/**
 * 上传返回信息
 *
 * @author LiYuanCheng
 * @date 2020-01-14 13:51
 */
@Data
@ToString
public class UploadResult {
  private String filename;

  private String filePath;

  private String key;

  private String thumbPath;

  private String suffix;

  private MediaType mediaType;

  private Long size;

  private Integer width;

  private Integer height;
}
