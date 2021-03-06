/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eclassregistry.model.repositories;

import com.eclassregistry.model.entity.ClassEntity;
import com.eclassregistry.model.entity.TeacherEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Mihailo
 */
@Repository
public interface ClassRepository extends JpaRepository<ClassEntity, TeacherEntity> {
    ClassEntity findByClassId(int id);
    
    @Query(value = "Select classes.class_name FROM classes WHERE classes.class_id =?1",nativeQuery = true)
    String getClassNameFromClassId(int classId);
}
