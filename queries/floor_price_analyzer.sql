-- Phase 12: Yield Optimization Engine (Historical Bid Landscape Analysis)
-- Evaluates performance and dynamically recommends inventory pricing updates

SELECT 
    ad_unit_id,
    device_type,
    COUNT(bid_id) AS total_bids_received,
    
    -- Calculate key distribution statistics for the incoming financial bids
    AVG(bid_amount_cpm) AS avg_bid_received,
    MAX(bid_amount_cpm) AS highest_bid_received,
    
    -- Calculate the current auction win rate percentage
    (COUNT(CASE WHEN win_status = 'WIN' THEN 1 END) * 100.0 / COUNT(bid_id)) AS current_win_rate,
    
    -- Yield Optimization Engine: Automated pricing rule generation
    CASE 
        WHEN (COUNT(CASE WHEN win_status = 'WIN' THEN 1 END) * 100.0 / COUNT(bid_id)) > 85.0 
            THEN 'Underpriced: Raise floor price by 15% to capture higher CPMs'
        WHEN (COUNT(CASE WHEN win_status = 'WIN' THEN 1 END) * 100.0 / COUNT(bid_id)) < 20.0 
            THEN 'Overpriced: Lower floor price by 10% to salvage fill rate'
        ELSE 'Optimized: Pricing profile is aligned with market demand'
    END AS automated_yield_action

FROM Bid_Landscape_Logs
GROUP BY ad_unit_id, device_type
-- Focus only on established high-volume paths to prevent knee-jerk pricing changes
HAVING COUNT(bid_id) >= 1000  
ORDER BY avg_bid_received DESC;
