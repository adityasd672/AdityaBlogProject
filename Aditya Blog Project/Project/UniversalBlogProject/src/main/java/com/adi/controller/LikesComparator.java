package com.adi.controller;

import java.util.Comparator;

import com.adi.pojo.Post;

public class LikesComparator implements Comparator<Post>{

	@Override
	public int compare(Post o1, Post o2) {
		
		return Integer.compare(o2.getLikes().size(), o1.getLikes().size());
	}

}
