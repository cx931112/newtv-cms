package net.chinaott.cms.core.actor.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "cms_actor_type")
public class ActorType implements Serializable{

	private static final long serialVersionUID = 6746057824217145915L;

	/**
	 * 类型ID
	 */
	 @Id
	 @GeneratedValue(strategy = GenerationType.AUTO)
     @Column(name = "type_id")
	 private Integer typeId;

	 /**
	  * 类型值
	  */
	 @Column(name = "type_value")
	 private String typeValue;

	 /**
	  * 类型名称
	  */
	 @Column(name = "type_name")
	 private String typeName;
	 
}
