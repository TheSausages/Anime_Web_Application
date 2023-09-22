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
@Table(name = "thread_user_status", schema = "forum")
public class ThreadUserStatus {

    @EmbeddedId
    private ThreadUserStatusId threadUserStatusId;

    @Column(name = "is_watching", nullable = false)
    @ColumnDefault("false")
    private boolean isWatching;

    @Column(name = "is_blocked", nullable = false)
    @ColumnDefault("false")
    private boolean isBlocked;

    @Embeddable
    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class ThreadUserStatusId implements Serializable {

        @Column(name = "user_id", nullable = false)
        private UUID userId;

        @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
        @JoinColumn(name = "thread_id", nullable = false)
        private Thread thread;
    }
}
