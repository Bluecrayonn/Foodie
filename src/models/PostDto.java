package models;

import java.sql.Date;

public class PostDto {
	int postId;
	int writerId;
	String title;
	int elapsedTime;
	String content;
	String mainImage;
	Date postDate;
	// 굳이 count 필요할까?
	int bookmarkCount;


	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public int getWriterId() {
		return writerId;
	}

	public void setWriterId(int writerId) {
		this.writerId = writerId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getElapsedTime() {
		return elapsedTime;
	}

	public void setElapsedTime(int elapsedTime) {
		this.elapsedTime = elapsedTime;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMainImage() {
		return mainImage;
	}

	public void setMainImage(String mainImage) {
		this.mainImage = mainImage;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public int getBookmarkCount() {
		return bookmarkCount;
	}

	public void setBookmarkCount(int bookmarkCount) {
		this.bookmarkCount = bookmarkCount;
	}

	public PostDto() {

	}
	
	public PostDto(int writerId, String title, String content, String mainImage, int elapsedTime) {
		this.title = title;
		this.writerId = writerId;
		this.elapsedTime = elapsedTime;
		this.content = content;
		this.mainImage = mainImage;
	}
	
	public PostDto(int postId, int writerId, String title, String content, String mainImage, int elapsedTime) {
		this.postId = postId;
		this.title = title;
		this.writerId = writerId;
		this.elapsedTime = elapsedTime;
		this.content = content;
		this.mainImage = mainImage;
	}
}
