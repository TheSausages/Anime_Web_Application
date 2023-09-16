package anime.app.anime.entity;

import jakarta.persistence.*;
import java.io.Serializable;
import java.util.UUID;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.ColumnDefault;

@Data
@Entity
@Table(name = "review_opinion", schema = "anime")
public class ReviewOpinion {

    @EmbeddedId
    private ReviewOpinionId reviewOpinionId;

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
    public static class ReviewOpinionId implements Serializable {

        private UUID userId;

        @ManyToOne
        @JoinColumn(name = "review_id")
        private Review review;
    }
}
