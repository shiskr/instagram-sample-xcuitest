//
//  FeedCell.swift
//  Instagram
//
//  Created by Cristian Crasneanu on 01.08.2023.
//

import SwiftUI

protocol FeedCellDelegate {
    func feedCellDidTouchLike(cell: FeedCell?, item: FeedModels.DisplayedItem)
    func feedCellDidTouchComment(cell: FeedCell?, item: FeedModels.DisplayedItem)
    func feedCellDidTouchShare(cell: FeedCell?, item: FeedModels.DisplayedItem)
}

struct FeedCell: View {
    @ObservedObject var item: FeedModels.DisplayedItem
    var delegate: FeedCellDelegate?
    
    var body: some View {
        VStack(spacing: ApplicationConstraints.constant.x0.rawValue) {
            self.setupUserDetails()
            self.setupPostImage()
            self.setupButtons()
            self.setupLikes()
            self.setupCaption()
            self.setupTimeAgo()
        }
    }
    
    @ViewBuilder func setupUserDetails() -> some View {
        HStack {
            self.setupUserImage()
            Text(item.username ?? String())
                .font(.footnote)
                .fontWeight(.semibold)
            Spacer()
        }
        .padding(.leading, ApplicationConstraints.constant.x8.rawValue)
    }
    
    @ViewBuilder func setupUserImage() -> some View {
        if let urlString = item.userImageUrl, let url = URL(string: urlString) {
            AsyncImage(url: url, content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            }, placeholder: {
                ProgressView()
            })
            .scaledToFill()
            .frame(width: ApplicationConstraints.constant.x40.rawValue, height: ApplicationConstraints.constant.x40.rawValue)
            .clipShape(Circle())
        } else if let placeholder = item.userImagePlaceholder {
            Image(systemName: placeholder)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaledToFill()
                .frame(width: ApplicationConstraints.constant.x40.rawValue, height: ApplicationConstraints.constant.x40.rawValue)
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder func setupUserImagePlaceholder() -> some View {
        EmptyView()
    }
    
    @ViewBuilder func setupPostImage() -> some View {
        Group {
            if let urlString = item.postImageUrl, let url = URL(string: urlString) {
                AsyncImage(url: url, content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                }, placeholder: {
                    ProgressView()
                })
                .scaledToFill()
            } else if let placeholder = item.postImagePlaceholder {
                Image(systemName: placeholder)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame( height: ApplicationConstraints.constant.x100.rawValue)
            } else {
                EmptyView()
            }
        }
        .frame(height: ApplicationConstraints.constant.x100.rawValue * ApplicationConstraints.constant.x4.rawValue)
        .clipShape(Rectangle())
        .padding(.top, ApplicationConstraints.constant.x4.rawValue)
        
        
    }
    
    @ViewBuilder func setupButtons() -> some View {
        HStack(spacing: ApplicationConstraints.constant.x16.rawValue) {
            self.setupLikeButton()
            self.setupCommentButton()
            self.setupShareButton()  
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, ApplicationConstraints.constant.x8.rawValue)
        .padding(.top, ApplicationConstraints.constant.x8.rawValue)
        .foregroundColor(ApplicationStyle.colors.black())
    }
    
    @ViewBuilder func setupLikes() -> some View {
        Text("\(self.item.likeCount) likes")
            .font(.footnote)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, ApplicationConstraints.constant.x8.rawValue)
            .padding(.top, ApplicationConstraints.constant.x4.rawValue)
    }
    
    @ViewBuilder func setupLikeButton() -> some View {
        let systemName = self.item.isLiked == true ? FeedStyle.shared.cellViewModel.likedHeartImage : FeedStyle.shared.cellViewModel.defaultHeartImage
        let foregroundColor = self.item.isLiked == true ? FeedStyle.shared.cellViewModel.likedColor : FeedStyle.shared.cellViewModel.defaultLikeColor
        Button {
            self.delegate?.feedCellDidTouchLike(cell: self, item: self.item)
        } label: {
            if self.item.isUpdatingLikeState {
                ProgressView()
            } else {
                Image(systemName: systemName)
                    .imageScale(.medium)
                    .foregroundColor(foregroundColor)
            }
        }
    }
    
    @ViewBuilder func setupCommentButton() -> some View {
        Button {
            print("Comment post")
        } label: {
            Image(systemName: FeedStyle.shared.cellViewModel.commentImage)
                .imageScale(.medium)
        }
    }
    
    @ViewBuilder func setupShareButton() -> some View {
        Button {
            print("Share post")
        } label: {
            Image(systemName: FeedStyle.shared.cellViewModel.shareImage)
                .imageScale(.medium)
        }
    }
    
    @ViewBuilder func setupCaption() -> some View {
        HStack {
            Text("\(self.item.username ?? String()) ").fontWeight(.semibold) +
            Text(self.item.caption ?? String())
        }
        .font(.footnote)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, ApplicationConstraints.constant.x8.rawValue)
        .padding(.top, ApplicationConstraints.constant.x2.rawValue)
    }
    
    @ViewBuilder func setupTimeAgo() -> some View {
        Text(self.item.timeAgo ?? String())
            .font(.footnote)
            .foregroundColor(ApplicationStyle.colors.gray())
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, ApplicationConstraints.constant.x8.rawValue)
            .padding(.top, ApplicationConstraints.constant.x2.rawValue)
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(item: FeedModels.DisplayedItem(id: String(), userImagePlaceholder: FeedStyle.shared.cellViewModel.userPlaceholderImage, postImagePlaceholder: FeedStyle.shared.cellViewModel.postPlaceholderImage))
    }
}
