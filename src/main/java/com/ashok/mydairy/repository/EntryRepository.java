package com.ashok.mydairy.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ashok.mydairy.entity.Entry;

public interface EntryRepository extends JpaRepository<Entry, Long> {

	public List<Entry> findByUserid(long id);
}
