package anime.app.forum.entity;

import jakarta.persistence.*;
import java.io.Serializable;
import java.util.UUID;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.ColumnDefault;

@Data
@Entity
@Table(name = "post_user_status", schema = "forum")
public class PostUserStatus {

    @EmbeddedId
    private PostUserStatusId postUserStatusId;

    @Column(name = "is_liked", nullable = false)
    @ColumnDefault("false")
    private boolean isLiked;

    @Column(name = "is_disliked", nullable = false)
    @ColumnDefault("false")
    private boolean isDisliked;

    @Column(name = "is_reported", nullable = false)
    @ColumnDefault("false")
    private boolean isReported;

    @Embeddable
    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class PostUserStatusId implements Serializable {

        @Column(name = "user_id", nullable = false)
        private UUID userId;

        @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
        @JoinColumn(name = "post_id", nullable = false)
        private Post post;
    }
}
