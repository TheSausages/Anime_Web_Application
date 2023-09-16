package anime.app.anime.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.PastOrPresent;
import jakarta.validation.constraints.PositiveOrZero;
import java.io.Serializable;
import java.time.Instant;
import java.time.LocalDate;
import java.util.UUID;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.validator.constraints.Range;

@Data
@Entity
@Table(name = "anime_user_info", schema = "anime")
public class AnimeUserInfo {

    @EmbeddedId
    private AnimeUserInfoId id;

    @Column(name = "status", nullable = false)
    @Enumerated(EnumType.STRING)
    private AnimeUserStatus status;

    @Column(name = "watch_start_date")
    @PastOrPresent(message = "TODO ADD")
    private LocalDate watchStartDate;

    @Column(name = "watch_end_date")
    @PastOrPresent(message = "TODO ADD")
    private LocalDate watchEndDate;

    @Column(name = "nr_episodes_seen", nullable = false)
    @ColumnDefault("0")
    @PositiveOrZero(message = "TODO ADD")
    private int nrOfEpisodesSeen;

    @Column(name = "is_favourite", nullable = false)
    private boolean isFavourite;

    @Column(name = "grade")
    @Range(max = 10, min = 0, message = "TODO ADD")
    private Integer grade;

    @UpdateTimestamp
    @Column(name = "modification")
    private Instant modification;

    @OneToOne(
        cascade = CascadeType.ALL,
        orphanRemoval = true,
        fetch = FetchType.EAGER
    )
    @JoinColumn(name = "review")
    private Review review;

    @Embeddable
    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class AnimeUserInfoId implements Serializable {

        private UUID userId;

        @ManyToOne
        @JoinColumn(name = "anime_id")
        private Anime anime;
    }

    public enum AnimeUserStatus {
        NO_STATUS,
        WATCHING,
        COMPLETED,
        DROPPED,
        PLAN_TO_WATCH,
    }
}
