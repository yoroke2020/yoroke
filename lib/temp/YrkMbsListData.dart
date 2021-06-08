class YrkMbsListData {
  static final List<String> _postLabelList = [
    "공유하기",
    "저장하기",
    "글 복사하기",
    "게시물 숨기기",
    "사용자 차단하기",
    "신고하기"
  ];

  static final List<String> _postImageList = [
    "icon_share.svg",
    "icon_save_black.svg",
    "icon_share.svg",
    "icon_save_black.svg",
    "icon_share.svg",
    "icon_save_black.svg",
  ];

  static final String _boardReviewTitle = "후기 게시판";
  static final String _boardQnaTitle = "고민/질문 게시판";
  static final String _boardJobFindingTitle = "구인구직 게시판";

  static final List<String> _boardReviewLabelList = [
    "요양병원",
    "요양원",
    "복지관",
    "경로당",
    "노인교실",
    "보호센터",
  ];

  static final List<String> _boardQnaLabelList = [
    "고민 게시글",
    "질문 게시글",
  ];

  static final List<String> _boardJobFindingLabelList = [
    "구인 게시글",
    "구직 게시글",
  ];

  static final List<String> _searchLabelList = [
    "전체 게시판",
    "고민/질문 게시판",
    "구인구직 게시판",
    "시설찾기",
    "정보공유"
  ];

  static List<String> getLabelList(pageType) {
    switch (pageType) {
      case "post":
        return _postLabelList;
      case "boardReview":
        return _boardReviewLabelList;
      case "boardQna":
        return _boardQnaLabelList;
      case "boardJobFinding":
        return _boardJobFindingLabelList;
      case "search":
        return _searchLabelList;
      default:
        return <String>[];
    }
  }

  static List<String> getImageList(pageType) {
    switch (pageType) {
      case "post":
        return _postImageList;
      default:
        return <String>[];
    }
  }

  static String getTitleList(pageType) {
    switch (pageType) {
      case "boardReview":
        return _boardReviewTitle;
      case "boardQna":
        return _boardQnaTitle;
      case "boardJobFinding":
        return _boardJobFindingTitle;
      default:
        return "";
    }
  }
}
