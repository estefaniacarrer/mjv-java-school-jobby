package com.schooljava.mjvschooljobby.repository;

import com.schooljava.mjvschooljobby.model.Cidade;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CidadeRepository extends JpaRepository<Cidade, Integer> {
}
