# rtb-floor-price-optimization
-- Database Architecture: Defining the Real-Time Bidding Log Schema
-- Tracks granular bid values, wins, and layout locations

CREATE TABLE Bid_Landscape_Logs (
    bid_id VARCHAR(50) PRIMARY KEY,
    ad_unit_id VARCHAR(50) NOT NULL,        -- e.g., 'top_leaderboard', 'sidebar_sticky'
    device_type VARCHAR(20) NOT NULL,       -- e.g., 'Desktop', 'Mobile', 'Tablet'
    bid_amount_cpm DECIMAL(10,4) NOT NULL,  -- Cost Per Mille (Price offered per 1,000 impressions)
    win_status VARCHAR(10) NOT NULL         -- 'WIN' or 'LOSS'
);
